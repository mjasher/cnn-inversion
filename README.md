## Deep autoregressive neural networks for high-dimensional inverse problems

[Deep autoregressive neural networks for high-dimensional inverse problems in groundwater contaminant source identification](https://agupubs.onlinelibrary.wiley.com/doi/abs/10.1029/2018WR024638)

[Shaoxing Mo](https://scholar.google.com/citations?hl=en&user=G6ac1xUAAAAJ&view_op=list_works&gmla=AJsN-F4ses_YhFsF-w2sFZLhacR7vrVyN1272g_B7XQyGbYsvy_6ReJpe4ChndNy_cFQ7UqXCSi82UiLjMB2dKyqSj8x5DaPRg), [Nicholas Zabaras](https://www.zabaras.com/), [Xiaoqing Shi](https://scholar.google.com/citations?user=MLKqgKoAAAAJ&hl=en&oi=sra), Jichun Wu

PyTorch implementation of deep autoregressive nueral networks based on a dense convolutional encoder-decoder network architecture for dynamical solute transport models with a time-varying source term and for subsequent high-dimensional inverse modeling. In the network, the time-varying process is represented using an autoregressive model, in which the time-dependent output at previous time step (y<sub>i-1;</sub>) is treated as input to predict the current output (y<sub>i;</sub>), that is, 

y<sub>i;</sub>=f(x<sub>i;</sub>,y<sub>i-1;</sub>), 

where x is the uncertain model input considered.
  
