	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080459B0
sub_080459B0: @ 0x080459B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080459E2
	ldr r0, _080459E8 @ =0x0203DC9C
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _080459DC
	ldr r0, _080459EC @ =0x03004690
	ldr r0, [r0]
	bl sub_08044B08
	adds r0, r5, #0
	bl Proc_End
_080459DC:
	adds r0, r5, #0
	bl Proc_Break
_080459E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080459E8: .4byte 0x0203DC9C
_080459EC: .4byte 0x03004690
