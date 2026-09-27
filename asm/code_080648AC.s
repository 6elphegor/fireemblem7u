	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080648AC
sub_080648AC: @ 0x080648AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r6, r0, #0
	ldr r0, _08064900 @ =0x08BA4984
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _08064904 @ =0x08BBE6B0
	adds r0, r5, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_080640D4
	str r0, [r4, #0x60]
	ldrh r2, [r0, #2]
	ldrh r3, [r6, #6]
	adds r1, r2, r3
	strh r1, [r0, #2]
	ldrh r2, [r0, #4]
	ldrh r6, [r6, #8]
	adds r1, r2, r6
	strh r1, [r0, #4]
	ldr r0, [r4, #0x5c]
	ldr r1, _08064908 @ =0x0826AC3C
	bl sub_0806421C
	ldr r0, [r4, #0x5c]
	ldr r1, _0806490C @ =0x0826A9E8
	bl sub_080641EC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064900: .4byte 0x08BA4984
_08064904: .4byte 0x08BBE6B0
_08064908: .4byte 0x0826AC3C
_0806490C: .4byte 0x0826A9E8
