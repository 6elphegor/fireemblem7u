	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonBg2ScrollExt
NewEkrDragonBg2ScrollExt: @ 0x08065C24
	push {r4, r5, r6, r7, lr}
	ldr r2, _08065C74 @ =0x0201FB2C
	movs r1, #0
	adds r0, r2, #0
	ldr r4, _08065C78 @ =0x0201FC6C
	ldr r3, _08065C7C @ =0x0201FB20
	mov ip, r3
	ldr r5, _08065C80 @ =0x0201FB24
	ldr r6, _08065C84 @ =0x0201FB28
	ldr r7, _08065C88 @ =EkrDragonBg2Scroll_OnVBlank
	movs r3, #0
_08065C3A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08065C3A
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_08065C4A:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08065C4A
	movs r4, #0
	mov r1, ip
	str r4, [r1]
	str r0, [r5]
	str r0, [r6]
	adds r0, r7, #0
	bl SetOnHBlankA
	ldr r0, _08065C8C @ =0x08BD94B8
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08065C74: .4byte 0x0201FB2C
_08065C78: .4byte 0x0201FC6C
_08065C7C: .4byte 0x0201FB20
_08065C80: .4byte 0x0201FB24
_08065C84: .4byte 0x0201FB28
_08065C88: .4byte EkrDragonBg2Scroll_OnVBlank
_08065C8C: .4byte 0x08BD94B8
