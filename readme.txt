
Design of Experiments Toolbox


Purpose
-------

The goal of this toolbox is to provide design of experiments techniques, along with functions for model building.


Features
--------

Latin Hypercube Designs

 * X = doetbx_lhsdesign(n,p) // LHS Design (without improvement).

 * X = doetbx_lhsdesign(n,p,'criterion',criterion) // Optimized LHS Design based on a criterion. Criterion can be 'maximin','correlation' or 'centered'.

Factorial Design

 * X = doetbx_fullfact(levels) // A full factorial design

 * X = doetbx_ff2n(n) // A full factorial design with 2 factors

 * X = doetbx_fracfact(generators) // A fractional factorial design

 * X = doetbx_star(nb_var) // Star Design of Experiments

 * X = doetbx_yates(y,sort_eff) // Yates Algorithm

 * X = doetbx_ryates(ef) // Inverse Yates Algorithm

Response Surface Designs

 * X = doetbx_bbdesign(n) // Box-Behnken design

 * X = doetbx_ccdesign(n) // Central composite design

Optimal Designs

X = doetbx_optdesign(n) // Optimal design (a-optimal)

 * X = doetbx_optdesign(n,'criterion',criterion) // Optimal Design based on a criterion. Criterion can be 'a' for A-Optimal, 'd' for D-Optimal, 'g' for G-Optimal and 'o' for O-Optimal Design.

 * X = mtlb_doptdesign(n) // Matlab compatible D-optimal Design

Supersaturated Designs

 * X = doetbx_comp_ssd(M_doe, model) // Supersaturated Design ('a-optimal').

 * X = doetbx_comp_ssd(M_doe, model,'criterion',criterion) // Supersaturated Design based on a criterion. Criterion can be 'a-optimal', 'd-optimal', 'average-khi2', 'maximum-khi2', 'r-value'(correlation coefficient).

Regression Analysis

 * X = doetbx_poly_model(mod_type, nb_var, order) // Produces a polynomial model

 * X = doetbx_model_select(nb_var, model_old, measures, Log,criterion) // Produces a new polynomial model using forward or backward selection. Default is 'forward'.

 * X = doetbx_plot_model(meas_learn, estim_learn, meas_valid, estim_valid) // Plots regression line and residuals distribution

 * X = doetbx_build_regression_matrix(H,model,build) // Regression matrix of a model

 * X = doetbx_var_regression_matrix(H, x, model, sigma) // Regression matrix of the variance of a model

 * X = doetbx_lars(X, y, method, stop, useGram, Gram, _trace) // Least Angle Regression or Lasso Regression

 * X = doetbx_rsquared(Y,Y_model) // R2 Computation

General Functions

 * X = doetbx_unnorm_doe_matrix(H, min_levels, max_levels) // Adjusts high and low values of a design to specified maximum and minimum values

 * doetbx_comp_WD2_crit.sci // Wrap-around L2 discrepancy criterion

 * doetbx_comp_CL2_crit(Data).sci // Centered L2 discrepancy criterion

 * doetbx_crossvalidate.sci // K-flod cross validation

 * doetbx_cvplot.sci // Plots cross validation results


 * doetbx_prbs.sci // A pseudo random binary signal generator

 * doetbx_merge.sci // Merges two samples

 * doetbx_diff.sci // Computes the difference of two samples

 * doetbx_scramble.sci // Permutes a sample

 * doetbx_standardize.sci // Center and normalize a sample

 * doetbx_normalize.sci // Normalises a sample


Internal functions

These functions are necessary for the computations, but must not be available at the user-level. Hence, no help page has to be created. But a unit test is required, to make sure that the functions are correctly working. In the future, these functions may be moved to another toolbox where they would be public function (e.g. a statistics toolbox).

 * X = doetbx_comp_*_opti_crit(M_doe, model) // Called by doetbx_*_opti(n,'*'), * can be 'a', 'd', 'g', 'o'

 * doetbx_repeat_center(nb_var,nb_center) // Repeats the center point in a Design, Called by doe_box_benkhen.sci in doe_beta1 toolbox

 * repchar.sci // Called by build_regression_matrix.sci

 * doe_opti_permu.sci // Optimises a design of experiments

 * doe_union.sci // Merges two samples, Called by doe_composite.sci in doe_beta1 toolbox 


