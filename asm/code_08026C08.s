	.include "macro.inc"

	.syntax unified

	thumb_func_start ArePidsAtMaxSupport
ArePidsAtMaxSupport: @ 0x08026C08
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r4, #0
	bl GetUnitSupportNumByPid
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetUnitSupportLevel
	cmp r0, #2
	bgt _08026C30
	movs r0, #0
	b _08026C32
_08026C30:
	movs r0, #1
_08026C32:
	pop {r4, r5}
	pop {r1}
	bx r1
