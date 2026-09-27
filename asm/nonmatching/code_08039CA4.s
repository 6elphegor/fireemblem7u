	.include "macro.inc"

	.syntax unified

	thumb_func_start AiEquipBestConsideringDanger
AiEquipBestConsideringDanger: @ 0x08039CA4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmn r1, r0
	beq _08039CC8
	cmp r1, r0
	blo _08039CC0
	movs r0, #1
	adds r1, r3, #0
	bl AiEquipBestMatch
	b _08039CC8
_08039CC0:
	movs r0, #2
	adds r1, r3, #0
	bl AiEquipBestMatch
_08039CC8:
	pop {r0}
	bx r0
