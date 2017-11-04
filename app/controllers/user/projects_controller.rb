class User::ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.where(:user_id => current_user).order('created_at DESC')
  end

  def new
    @project = Project.new
    @default_value = defalut_value
  end

  def show
  end

  def edit
    @project.main_image.cache! unless @project.main_image.blank?
    @default_value = @project.description
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = 'Project was successfully created.'
      redirect_to user_project_path @project
    else
      # Error handling
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = 'Project was successfully updated.'
      redirect_to user_project_path @project
    else
      render :edit
    end
  end

  def destroy
    if @project.delete
      flash[:success] = 'Project was successfully deleted.'
    else
      render :edit
    end
    redirect_to user_projects_path
  end
  
  private

  def project_params
    params.require(:project).permit([
        :title,
        :main_image,
        :main_image_cache,
        :description,
        :is_published,
        :organization,
        :url,
        :established_at
    ])
  end

  def defalut_value
    value = <<-EOS

ここにプロジェクトの概要を記入してください  

マークダウン式の記述方法です。  
改行は半角スペース2つです。  

[リンクの入れ方は](https://google.com)この通り  
**これで太文字の記入**  
*斜文字*
# タイトル1
## タイトル2
### タイトル3
#### タイトル4
##### タイトル5
![画像の入れ方](http://www.mext.go.jp/a_menu/kokusai/tobitate/__icsFiles/artimage/2014/04/21/c_edu08_04/Ryugaku-JAPAN_Logojpg.jpg)

--  
#### 最近の活動
2020/11/11 イベントを行います！    

    EOS
    value
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
