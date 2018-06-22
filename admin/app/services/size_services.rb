class SizeServices
  attr_reader :params, :flash

  def initialize(params, flash)
    @params = params
    @flash  = flash
  end

  def create_size
    @size = Size.new size_params
    if @size.save
      flash[:success] = "add successfully"
    end
  end

  def update_size
    size = find_size
    if size.update(size_params)
      flash[:success] = "update successfully"
    end
  end

  def destroy_size
    size = find_size
    if size.destroy!
      flash[:success] = "deleted successfully"
    end
  end

  def find_size
    return @size if @size
    @size = Size.find_by(id: params[:id])
  end

  def load_list_size
    return @sizes if @sizes
    @sizes = Size.all
  end

  def size_params
    params.require(:size).permit :name
  end
end  
