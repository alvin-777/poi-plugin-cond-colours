{$, _, $$, React, ReactBootstrap, FontAwesome, ROOT} = window
{Input, ButtonInput} = ReactBootstrap

CondList = React.createClass
  render: ->
    createItem = (condVal, index) ->
      <li key={index + '.Cond.' + condVal} className={window.getCondStyle condVal}>Cond. {condVal}</li>
    <ul>{@props.items.map(createItem)}</ul>

module.exports =
  name: 'cond-colours'
  priority: 0
  displayName: <span><FontAwesome key={0} name='star' />{' 康德特效'}</span>
  description: "Check text effects for entered cond values."
  version: '1.0.0'
  author: 'Alvin Yu'
  link: 'https://github.com/alvin-777/poi-plugin-cond-colours'
  reactClass: React.createClass
    getInitialState: ->
      condItems: []
      newVal: ''
      style: ''
    handleChange: (e) ->
      @setState
        newVal: e.target.value
        style: if !isNaN(parseInt e.target.value) and !isNaN(e.target.value) then "success" else "error"
    handleSubmit: (e) ->
      e.preventDefault()
      if @state.style == 'success'
        nextItem = @state.condItems.concat(parseInt @state.newVal)
        @setState
          condItems: nextItem
          newVal: ''
          style: ''
    handleReset: (e) ->
      e.preventDefault()
      @setState
        condItems: []
        newVal: ''
        style: ''
    render: ->
      <div>
        <form onSubmit={@handleSubmit} onReset={@handleReset}>
          <h5>Add</h5>
          <Input type="text" addonBefore="Cond." placeholder="Enter a number" bsStyle={@state.style} onChange={@handleChange} value={@state.newVal} />
          <h5>Cond List</h5>
          <CondList items={@state.condItems} />
          <br />
          <ButtonInput type="reset" value="Clear" />
        </form>
      </div>
