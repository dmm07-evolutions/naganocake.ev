class EndUser::CategoriesController < ApplicationController
	def index
		# @category_id = params[:id]
		# @category = Category.find(params[:id])
		@category = Category.all
		@questionnaires1 = Questionnaire.where(category_id: 5 )
		@questionnaires2 = Questionnaire.where(category_id: 6 )
		@questionnaires3 = Questionnaire.where(category_id: 7 )
		@questionnaires4 = Questionnaire.where(category_id: 8 )
	end
	 private

    def categories_params
    	params.require(:category).permit(:name,:questionnaires_id)
    end
end


# ※findでidを数字指定して
# catagtgoryを出していく


# アンケートページ
# お客様の声のページ
# 記入

# custmaer側には
# 応募のフォーム
# クレーム、等改善し質を高めるためのもの
# 質の良いクレームを集める


# admin側には
# クレーム
# 改善策
# 提案
# お客様の声が表示される→余裕あればニックネーム等の機能追加も面白い？