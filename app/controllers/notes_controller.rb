class NotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    def index
        @notes = current_user.notes
    end

    def new
        @note = Note.new
    end

    def create
        @note = current_user.notes.build(note_params)

        if @note.save
            redirect_to notes_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show

    end

    def edit

    end

    def update
        if @note.update(note_params)
            redirect_to @note
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @note.destroy
        redirect_to notes_path, notice: "Note deleted successfully."
    end

    private

    def note_params
        params.require(:note).permit(:title, :content)
    end

    def set_note
        @note = current_user.notes.find(params[:id])
    end
end
