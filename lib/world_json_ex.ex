defmodule WorldJson.Compiler do
  defmacro compile(pattern, parent, prepend \\ true) do
    {:ok, dir} = :application.get_env(:world_json, :geo_files)
    fallback = :filename.dirname(:filename.dirname(dir)) ++ '/world_geo_json/'
    files = :filelib.wildcard(dir ++ '/world_geo_json/' ++ pattern) ++
      :filelib.wildcard(fallback ++ pattern)
    subregions = for file <- files do
      name = :erlang.list_to_binary(:filename.basename(file, '.geo.json'))
      if prepend, do: parent <> "-" <> name, else: name
    end
    subs = quote do
      def subregions(unquote(parent)) do
        unquote(subregions)
      end
    end
    regs = for file <- files do
      contents = File.read!(file)
      %{"features" => regions} = Poison.decode!(contents)
      for region <- regions do
        id = Map.get(region, "id")
        quote do
          def geo(unquote(id)) do
            {:ok, unquote(Macro.escape(region))}
          end
        end
      end
    end
    [subs, regs]
  end
end

defmodule WorldJson do
  require WorldJson.Compiler
  quote do
    unquote(WorldJson.Compiler.compile('countries/*.geo.json', "world", false))
    unquote(WorldJson.Compiler.compile('countries/USA/*.geo.json', "USA"))
  end
  def geo(_) do
    {:error, :not_found}
  end
  def subregions(_) do
    {:ok, nil}
  end
end
