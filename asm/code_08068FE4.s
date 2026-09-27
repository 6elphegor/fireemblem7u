	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_OnPrepare
EkrLvup_OnPrepare: @ 0x08068FE4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	cmp r1, #0
	beq _08068FF8
	adds r0, r4, #0
	bl Proc_Break
	b _0806904A
_08068FF8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08069016
	bl NewEfxSpellCast
	ldr r0, [r4, #0x5c]
	movs r1, #0x78
	movs r2, #0x58
	bl NewEfxLvupOBJ2
	b _0806904A
_08069016:
	cmp r0, #0x19
	bne _08069028
	ldr r0, [r4, #0x5c]
	bl NewEfxLvupBG2
	ldr r0, [r4, #0x5c]
	bl NewEfxLvupBGCOL
	b _0806904A
_08069028:
	cmp r0, #0x3b
	bne _08069034
	ldr r0, [r4, #0x5c]
	bl NewEfxlvupbg
	b _0806904A
_08069034:
	cmp r0, #0x49
	bne _0806903E
	bl RegisterEfxSpellCastEnd
	b _0806904A
_0806903E:
	cmp r0, #0x53
	bne _0806904A
	strh r1, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0806904A:
	pop {r4}
	pop {r0}
	bx r0
