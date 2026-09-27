	.include "macro.inc"

	.syntax unified

	thumb_func_start LAUnitDeaths_FindNextAndStart
LAUnitDeaths_FindNextAndStart: @ 0x08046DE8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
_08046DEC:
	ldr r1, [r5, #0x58]
	cmp r1, #5
	bne _08046DFC
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08046E60
_08046DFC:
	ldr r0, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	ldr r1, _08046E20 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046E18
	ldr r0, [r6]
	cmp r0, #0
	bne _08046E24
_08046E18:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	b _08046DEC
	.align 2, 0
_08046E20: .4byte 0x00010004
_08046E24:
	bl RefreshUnitSprites
	adds r0, r6, #0
	bl HideUnitSprite
	adds r0, r6, #0
	bl StartMu
	adds r4, r0, #0
	ldr r1, _08046E68 @ =0x02033E00
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	ldr r0, [r6, #0xc]
	ldr r1, _08046E6C @ =0xFFFFFDFF
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
_08046E60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046E68: .4byte 0x02033E00
_08046E6C: .4byte 0xFFFFFDFF
