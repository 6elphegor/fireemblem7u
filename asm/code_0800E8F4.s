	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GiveGold
EvtCmd_GiveGold: @ 0x0800E8F4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r4, [r0, #4]
	cmp r4, #0
	bne _0800E902
	ldr r4, [r5, #0x58]
_0800E902:
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0800E91C
	bl GetGold
	adds r0, r0, r4
	bl SetGold
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartPopup_800EE90
	b _0800E93C
_0800E91C:
	ldr r0, _0800E944 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0xc0
	ldrb r1, [r1, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0800E934
	bl GetGold
	adds r0, r0, r4
	bl SetGold
_0800E934:
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartPopup_800EE4C
_0800E93C:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E944: .4byte 0x03004690
