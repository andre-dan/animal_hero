class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update destroy]
  before_action :set_options_pet, :set_options_ong, only: %i[new create edit update]
  before_action :authenticate, only: %i[index edit show]

  def index
    @pets = current_user.pets
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet criado com sucesso' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :species, :birth_date, :ong_id, :avatar)
    end

    def set_options_pet
      @options_pet = Pet.species.keys.map {|species| [species.titleize,species]}
    end

    def set_options_ong
      @options_ong = Ong.all.pluck(:nome, :id)
    end

    def authenticate
      return redirect_to entrar_path, notice:'Nenhum usuário logado, precisa logar primeiro.' unless user_signed_in?
    end
end
