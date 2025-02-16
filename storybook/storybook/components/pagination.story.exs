defmodule Storybook.Components.Pagination do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Pagination
  alias DaisyUIComponents.Utils

  def function, do: &Pagination.pagination/1
  def imports, do: []

  def variations do
    [
      %Variation{
        id: :pagination,
        attributes: %{
          page: 2,
          page_size: 1,
          total_entries: 4
        }
      },
      %Variation{
        id: :pagination_with_big_total_entries,
        attributes: %{
          page: 1,
          page_size: 10,
          total_entries: 1000
        }
      },
      %Variation{
        id: :pagination_in_middle,
        attributes: %{
          page: 5,
          page_size: 10,
          total_entries: 100
        }
      },
      %VariationGroup{
        id: :pagination_sizes,
        variations:
          for size <- Utils.sizes() do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                page: 2,
                page_size: 1,
                total_entries: 4,
                size: size
              }
            }
          end
      }
    ]
  end
end
