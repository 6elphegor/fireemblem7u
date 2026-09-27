	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080636AC
sub_080636AC: @ 0x080636AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806372C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063730 @ =0x08BA4644
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _08063734 @ =0x081E971C
	str r1, [r0, #0x48]
	ldr r1, _08063738 @ =0x08BA465C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0806373C @ =0x081FAC38
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08063740 @ =0x081F9FC4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r3, _08063744 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806372C: .4byte 0x0201774C
_08063730: .4byte 0x08BA4644
_08063734: .4byte 0x081E971C
_08063738: .4byte 0x08BA465C
_0806373C: .4byte 0x081FAC38
_08063740: .4byte 0x081F9FC4
_08063744: .4byte 0x03002870
