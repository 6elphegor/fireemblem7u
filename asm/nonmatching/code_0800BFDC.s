	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_CameraLeader
EvtCmd_CameraLeader: @ 0x0800BFDC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
