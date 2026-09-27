	.include "macro.inc"

	.syntax unified

	thumb_func_start SetUiSpinningArrowFastMaybe
SetUiSpinningArrowFastMaybe: @ 0x080A8D98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8DCC @ =0x08CE4A40
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A8DC6
	cmp r4, #0
	bne _080A8DB0
	movs r0, #1
	str r0, [r1, #0x4c]
_080A8DB0:
	cmp r4, #1
	bne _080A8DB6
	str r4, [r1, #0x50]
_080A8DB6:
	cmp r4, #2
	bne _080A8DBE
	movs r0, #1
	str r0, [r1, #0x4c]
_080A8DBE:
	cmp r4, #3
	bne _080A8DC6
	movs r0, #1
	str r0, [r1, #0x50]
_080A8DC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8DCC: .4byte 0x08CE4A40
