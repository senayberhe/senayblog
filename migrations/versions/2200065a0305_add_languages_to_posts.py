"""add languages to posts

Revision ID: 2200065a0305
Revises: 3821db2c4f48
Create Date: 2022-03-30 10:12:52.474445

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '2200065a0305'
down_revision = '3821db2c4f48'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('post', sa.Column('language', sa.String(length=5), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('post', 'language')
    # ### end Alembic commands ###
