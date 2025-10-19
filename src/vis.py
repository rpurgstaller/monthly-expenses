import sqlite3
import plotly.express as px
import pandas as pd
import numpy as np


EXP_QUERY = (
    """
    select v.category, 
           v.expense_name,
           v.amount_per_month, 
           v.expense_name || ':' || v.amount_per_month as exp_label 
    from monthly_expenses_v v
    """
)


def load_data() -> pd.DataFrame:
    conn = sqlite3.connect("../data.db")
    df = pd.read_sql_query(EXP_QUERY, conn)
    conn.close()
    return df


def show_expenses_by_category_treemap(df: pd.DataFrame, **kwargs):
    df_by_category = df.groupby("category").agg(
        {"exp_label": lambda x: "<br>".join(list(x)), "amount_per_month": "sum"}).reset_index()

    fig = px.treemap(
        df_by_category,
        path=['category'],
        values='amount_per_month',
        title='Expenses by Category',
        custom_data=['exp_label'],
        hover_data=['exp_label'],
        **kwargs
    )

    fig.data[0].hovertemplate = '%{customdata[0]}'
    fig.update_traces(texttemplate='%{label}<br>%{value:.2f}', textposition='middle center')

    return fig


def show_expenses_by_category_treemap_advanced(df: pd.DataFrame, **kwargs):
    fig = px.treemap(
        df,
        path=[px.Constant("expenses per month"), 'category', "expense_name"],
        values='amount_per_month',
        color='amount_per_month',
        color_continuous_scale=['#f7fbff', '#08306b'],
        title='Expenses by Category',
        custom_data=['exp_label'],
        hover_data=['exp_label'],
        color_continuous_midpoint=np.max(df['amount_per_month'])/2.0,
        **kwargs
    )

    fig.data[0].hovertemplate = '%{label}: %{value:.2f}'
    fig.update_traces(texttemplate='%{label}<br>%{value:.2f}', textposition='middle center')

    return fig


df_expenses = load_data()
treemap_fig = show_expenses_by_category_treemap(df_expenses)
treemap_fig.show()

treemap_advanced_fig = show_expenses_by_category_treemap_advanced(df_expenses)
treemap_advanced_fig.show()