	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805FF48
sub_0805FF48: @ 0x0805FF48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FF9C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FFA0 @ =0x08BA39C4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	ldr r0, _0805FFA4 @ =0x08296814
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _0805FFA8 @ =0x08296DA4
	ldr r1, _0805FFAC @ =0x02019784
	bl LZ77UnCompWram
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805FFB0 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF9C: .4byte 0x0201774C
_0805FFA0: .4byte 0x08BA39C4
_0805FFA4: .4byte 0x08296814
_0805FFA8: .4byte 0x08296DA4
_0805FFAC: .4byte 0x02019784
_0805FFB0: .4byte 0x03002870
