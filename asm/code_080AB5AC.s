	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB5AC
sub_080AB5AC: @ 0x080AB5AC
	push {lr}
	ldrh r2, [r0, #0x2a]
	rsbs r1, r2, #0
	orrs r1, r2
	lsrs r3, r1, #0x1f
	lsrs r1, r2, #4
	adds r1, #5
	adds r0, #0x36
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r0, #0
	bge _080AB5C6
	adds r0, r2, #2
_080AB5C6:
	asrs r0, r0, #2
	cmp r1, r0
	bgt _080AB5D0
	movs r0, #2
	orrs r3, r0
_080AB5D0:
	adds r0, r3, #0
	bl SetUiSpinningArrowConfig
	pop {r0}
	bx r0
	.align 2, 0
