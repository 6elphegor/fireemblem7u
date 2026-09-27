	.include "macro.inc"

	.syntax unified

	thumb_func_start ForceCenteredDragon
ForceCenteredDragon: @ 0x0807ED40
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x86
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r0, #0x91
	bl SetFlag
	adds r0, r4, #0
	movs r1, #1
	bl SetUnitHp
	ldr r0, [r4, #0xc]
	movs r1, #7
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoCenteredPosition
	pop {r4, r5}
	pop {r0}
	bx r0
