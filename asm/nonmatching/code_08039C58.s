	.include "macro.inc"

	.syntax unified

	thumb_func_start AiEquipBestMatch
AiEquipBestMatch: @ 0x08039C58
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #1
	rsbs r5, r5, #0
	movs r4, #0
	movs r3, #0
	movs r7, #0xff
	lsls r7, r7, #8
_08039C68:
	ldrh r0, [r1]
	cmp r0, #0
	beq _08039C82
	adds r2, r0, #0
	ands r0, r6
	cmp r0, #0
	beq _08039C82
	adds r0, r7, #0
	ands r0, r2
	cmp r0, r4
	bls _08039C82
	adds r4, r0, #0
	adds r5, r3, #0
_08039C82:
	adds r1, #2
	adds r3, #1
	cmp r3, #4
	ble _08039C68
	cmp r5, #0
	ble _08039C98
	ldr r0, _08039CA0 @ =0x03004690
	ldr r0, [r0]
	adds r1, r5, #0
	bl EquipUnitItemSlot
_08039C98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039CA0: .4byte 0x03004690
