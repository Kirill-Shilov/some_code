defmodule ForTests do
  defmacro only_test(do: block) do
    if Mix.env() == :test do
      quote do
        unquote(block)
      end
    end
  end
end
