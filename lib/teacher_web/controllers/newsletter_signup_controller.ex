defmodule TeacherWeb.NewsletterSignupController do
  use TeacherWeb, :controller

  alias Teacher.Newsletter.Signup

  def new(conn, _params) do
    changeset = Signup.changeset(%Signup{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"signup" => signup_params}) do
    signup_changeset =
      %Signup{}
      |> Signup.changeset(signup_params)

    case Teacher.Repo.insert(signup_changeset) do
      {:ok, _signup} ->
        conn
        |> put_flash(:info, "Signed up for the newsletter.")
        |> redirect(to: Routes.album_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)

    end
  end

end
