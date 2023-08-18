defmodule PaintByNumber do
  def palette_bit_size(color_count) when color_count <= 2, do: 1
  def palette_bit_size(color_count), do: 1 + palette_bit_size(div(color_count + 1, 2))

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, _color_count) when picture == <<>>, do: nil
  def get_first_pixel(picture, color_count) do
    bitlen = palette_bit_size(color_count)
    <<first_pixel::size(bitlen), _rest::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(picture, _color_count) when picture == <<>>, do: empty_picture()
  def drop_first_pixel(picture, color_count) do
    bitlen = palette_bit_size(color_count)
    <<_first_pixel::size(bitlen), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
