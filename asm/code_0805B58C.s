	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B58C
sub_0805B58C: @ 0x0805B58C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r5, #0x2c]
	ands r0, r1
	cmp r0, #0
	beq _0805B5E8
	ldrh r2, [r5, #0x32]
	subs r2, #0xc
	strh r2, [r5, #0x32]
	ldrh r1, [r5, #0x3a]
	adds r1, #0xc
	strh r1, [r5, #0x3a]
	ldr r0, _0805B5D8 @ =0x03002870
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, _0805B5DC @ =0x0827A12C
	ldr r4, _0805B5E0 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0805B5E4 @ =0x02023460
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	b _0805B61E
	.align 2, 0
_0805B5D8: .4byte 0x03002870
_0805B5DC: .4byte 0x0827A12C
_0805B5E0: .4byte 0x02019784
_0805B5E4: .4byte 0x02023460
_0805B5E8:
	ldrh r2, [r5, #0x34]
	adds r2, #8
	strh r2, [r5, #0x34]
	ldrh r1, [r5, #0x3c]
	adds r1, #8
	strh r1, [r5, #0x3c]
	ldr r0, _0805B64C @ =0x03002870
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, _0805B650 @ =0x0827A12C
	ldr r4, _0805B654 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0805B658 @ =0x02023460
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
_0805B61E:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805B644
	bl SpellFx_ClearBG1
	bl SpellFx_ClearColorEffects
	ldr r1, _0805B65C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805B644:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B64C: .4byte 0x03002870
_0805B650: .4byte 0x0827A12C
_0805B654: .4byte 0x02019784
_0805B658: .4byte 0x02023460
_0805B65C: .4byte 0x0201774C
