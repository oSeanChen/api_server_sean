require 'rails_helper'


RSpec.describe Api::V1::CoursesController, type: :controller do
  describe "#index" do
    it "index 成功讀取" do
      get :index
      expect(response).to have_http_status(200)  
    end
  end

  describe "#create" do
    context "create success" do
      before(:all) do
        course = create(:course)
        @course_params = {
          title: course.title,
          lecturer: course.lecturer
        }
      end
      it "create 完得到 status: 200" do
        post :create, params:{course: @course_params}
        expect(response).to have_http_status(200)
      end

      it "create 完確實新增一筆資料" do
        expect { post :create, params:{course: @course_params}}.to change{Course.count}.by(1)
      end 
    end

    context "create fail" do
      before(:all) do
        course = create(:course)
        @course_params_fail = {
       
        lecturer: course.lecturer
        }
      end
      it "回傳error '課程建立失敗'" do
         post :create, params:{course: @course_params_fail}
        expect(response.body).to match(/課程建立失敗/)
      end
    end
  end

  describe "#show" do
  end
  describe "#update" do
  end
  describe "#destroy" do
  end
end
