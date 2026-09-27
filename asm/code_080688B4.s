	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080688B4
sub_080688B4: @ 0x080688B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _08068900 @ =0x03002870
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _080688F8
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r0, [r5, #0x1c]
	ldr r1, _08068904 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _08068908 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl Proc_Break
_080688F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068900: .4byte 0x03002870
_08068904: .4byte 0xFFFFF7FF
_08068908: .4byte 0x0000F3FF
