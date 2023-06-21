defmodule Tmdb.Base do
  defmacro __using__(_) do
    quote do
      defp get!(url) do
        url
        |> process_url()
        |> Req.get!()
      end

      defp process_url(url) do
        api_key = Application.fetch_env!(:tmdb, :api_key)
        "https://api.themoviedb.org/3/" <> url <> "&api_key=#{api_key}"
      end
    end
  end
end
