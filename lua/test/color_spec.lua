
local colors = require('colorbuddy.color').colors
local Color = require('colorbuddy.color').Color

describe('Color class', function()
    it('should create something with a name', function()
        local test_color = Color.new('foobar', .5, .5, .5)
        assert.are.same('foobar', test_color.name)
    end)

    it('should add it to colors', function()
        local test_color = Color.new('foobar', .5, .5, .5)
        assert.are.same(colors.foobar, test_color)
    end)

    it('should be accessible via weird caps', function()
        local test_color = Color.new('foobar', .5, .5, .5)
        assert.are.same(colors.FooBar, test_color)
        assert.are.same(colors.fooBar, test_color)
        assert.are.same(colors.FOOBAR, test_color)
    end)

    it('should be accessible via weird caps from naming', function()
        local test_color = Color.new('fooBar', .5, .5, .5)
        assert.are.same(colors.FooBar, test_color)
        assert.are.same(colors.fooBar, test_color)
        assert.are.same(colors.FOOBAR, test_color)
    end)

    it('should convert rgb', function()
        local test_color = Color.new('foobar', '#123456')
        assert.are.same('#123456', test_color:to_rgb())
    end)

    it('should lighten rgb', function()
        local test_color = Color.new('foobar', '#123456')
        assert.are.same('#123456', test_color:to_rgb())

        assert.are.same(210, test_color:light()[1])
    end)

    it('should create children', function()
        local test_color = Color.new('foobar', .5, .5, .5)
        local child_color = test_color:new_child('kiddo', 'dark')

        assert.are.same('kiddo', child_color.name)
        assert.are.same(.4, child_color.L)
    end)

    it('should create children with arguments', function()
        local test_color = Color.new('foobar', .5, .5, .5)
        local child_color = test_color:new_child('kiddo', {'dark', 0.2})

        assert.are.same('kiddo', child_color.name)
        assert.are.same(0.3, child_color.L)
        assert.are.same(test_color.children['kiddo'], child_color)
    end)

    it('should create children with multiple arguments', function()
        local test_color = Color.new('foobar', .5, .5, .5)
        local child_color = test_color:new_child('kiddo', {'dark', 0.2}, {'light', 0.2})

        assert.are.same('kiddo', child_color.name)
        assert.are.same(0.5, child_color.L)
        assert.are.same(test_color.children['kiddo'], child_color)
    end)
end)
