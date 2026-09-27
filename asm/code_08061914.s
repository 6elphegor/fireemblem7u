	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061914
sub_08061914: @ 0x08061914
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r1, _08061998 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806199C @ =0x08BA3F0C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	str r0, [r5, #0x44]
	ldr r0, _080619A0 @ =0x081E9538
	str r0, [r5, #0x48]
	ldr r4, _080619A4 @ =0x082B35B0
	str r4, [r5, #0x4c]
	ldr r0, _080619A8 @ =0x082B1BB8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	subs r4, #0x20
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r5, #0x5c]
	ldr r2, _080619AC @ =0x082B35D0
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	ldr r0, _080619B0 @ =0x02000000
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _080619B8
	ldr r3, _080619B4 @ =0x03002870
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
	b _080619E4
	.align 2, 0
_08061998: .4byte 0x0201774C
_0806199C: .4byte 0x08BA3F0C
_080619A0: .4byte 0x081E9538
_080619A4: .4byte 0x082B35B0
_080619A8: .4byte 0x082B1BB8
_080619AC: .4byte 0x082B35D0
_080619B0: .4byte 0x02000000
_080619B4: .4byte 0x03002870
_080619B8:
	ldr r3, _08061A28 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x18]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x18]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	movs r0, #3
	ldrb r1, [r3, #0x14]
	orrs r0, r1
	strb r0, [r3, #0x14]
_080619E4:
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	ldr r6, _08061A2C @ =0x0000F3FF
	adds r1, r6, #0
	ldrh r2, [r7, #8]
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r2, #0
	orrs r1, r5
	strh r1, [r7, #8]
	adds r1, r6, #0
	ldrh r2, [r0, #8]
	ands r1, r2
	orrs r1, r5
	strh r1, [r0, #8]
	ldr r4, _08061A30 @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	cmp r1, #0
	beq _08061A20
	adds r0, r6, #0
	ldrh r2, [r1, #8]
	ands r0, r2
	orrs r0, r5
	strh r0, [r1, #8]
_08061A20:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061A28: .4byte 0x03002870
_08061A2C: .4byte 0x0000F3FF
_08061A30: .4byte 0x02000010
