class EndUser::QuestionnairesController < ApplicationController
	# aboutに書いてもいい？
	def index
       @Questionnaires = Questionnaire.all
	end
	def new
		@Questionnaire = Questionnaire.new
    end

	def create
		@Questionnaires = Questionnaire.new(questionnaires_params)
		@Questionnaires.save
		redirect_to questionnaires_path
		# redirect_to questionnaires_pathこれを書かないとcareate htmlページを探しちゃう
    end

    def edit
    	@Questionnaire = Questionnaire.find(params[:id])
    	# resouseにidがないと表示できないもとあるデータを使うからnewでわなくfind
    end

    def update
    	@Questionnaire = Questionnaire.find(params[:id])
    	# ※どのidのレコードを見つけてくるか？
    	@Questionnaire.update(questionnaires_params)
    	# タイトルとボディーをかえますよ
    	redirect_to questionnaires_path
    end

    def destroy
    	@Questionnaire = Questionnaire.find(params[:id])
    	# showとかからではないがメモが複数だからいる？
    	@Questionnaire.destroy
    	redirect_to questionnaires_path
    end

    private

    def questionnaires_params
    	params.require(:questionnaire).permit(:title, :body)
    end
end
