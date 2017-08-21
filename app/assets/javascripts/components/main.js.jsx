var AllProducts = React.createClass({
 getInitialState() {
  return { products: [] } 
},

componentDidMount() {
 $.getJSON('/products', (response) => {
  this.setState({ products: response }) }); 
},


render() {
		var products= this.state.products.map((product) => {

			var items = product.product_items.map((item) => {
				return (
						<div>
							<ul>
								<li>style: {item['style']}</li>
								<li>waist: {item.waist}</li>
								<li>length: {item['length']}</li>
								<li>Amount available: {item['count']}</li>
							</ul>
						</div>
					)
			})
			return (
				<div className="product">
					<h3 className="productHeader">{product.product_name}</h3>
					<img className="product-image" src={product.product_image} />
					<p className="product-description">{product.product_description}</p>
					<div className="Item">
						{items}
					</div>
				</div>
				)
		})
		;

		return(

			<div className="wrapper">
				{products}
			</div>
		)
	},

})


var Body = React.createClass({

	render() {

		return (
			<div>
				<AllProducts />
			</div>
		)
	}

})