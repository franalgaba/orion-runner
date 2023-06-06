use core::traits::Into;
use array::ArrayTrait;
use option::OptionTrait;
use array::SpanTrait;

use orion::numbers::fixed_point::core::{FixedType, FixedTrait};
use orion::numbers::fixed_point::implementations::impl_8x23;
use orion::operators::tensor::implementations::impl_tensor_fp;
use orion::operators::tensor::core::{Tensor, TensorTrait};
use orion::utils::check_gas;

/// Cf: NNTrait::leaky_relu docstring
fn leaky_relu(z: @Tensor<u32>, alpha: @FixedType, threshold: u32) -> Tensor<FixedType> {
    assert(*alpha.mag < impl_8x23::ONE, 'alpha must be less than 1_fp');

    let mut data_result = ArrayTrait::<FixedType>::new();
    let mut data = *z.data;
    loop {
        check_gas();

        if data.len() == 0 {
            break ();
        };

        let current_index = *data.pop_front().unwrap();
        let fp_current_index = FixedTrait::new_unscaled(current_index.into(), false);
        if current_index >= threshold {
            data_result.append(fp_current_index);
        } else {
            data_result.append(fp_current_index * *alpha);
        };
    };

    return TensorTrait::new(*z.shape, data_result.span(), *z.extra);
}
