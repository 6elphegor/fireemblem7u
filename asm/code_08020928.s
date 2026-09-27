	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcEventWrapAnim_Loop
ProcEventWrapAnim_Loop: @ 0x08020928
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, _08020984 @ =0x08B93C10
	cmp r0, #0
	bne _0802093A
	ldr r4, _08020988 @ =0x08B93BCC
_0802093A:
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r3, #0
	adds r2, #0x4c
	cmp r0, #0
	beq _0802095E
	ldr r0, _0802098C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0802095E
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_0802095E:
	ldrh r6, [r2]
	adds r6, #1
	strh r6, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08020990
	adds r0, r3, #0
	bl Proc_Break
	b _080209B6
	.align 2, 0
_08020984: .4byte 0x08B93C10
_08020988: .4byte 0x08B93BCC
_0802098C: .4byte 0x08B857F8
_08020990:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0802099C
	bl RefreshUnitSprites
_0802099C:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _080209BC @ =0x0200323C
	adds r0, r0, r1
	ldr r1, _080209C0 @ =0x02022C60
	movs r2, #4
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
_080209B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080209BC: .4byte 0x0200323C
_080209C0: .4byte 0x02022C60
