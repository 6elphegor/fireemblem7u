	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateFireTileTrapTargets
GenerateFireTileTrapTargets: @ 0x0802BEA0
	push {r4, lr}
	adds r3, r2, #0
	ldr r2, _0802BEBC @ =0x0202E3DC
	ldr r4, [r2]
	lsls r2, r1, #2
	adds r2, r2, r4
	ldr r2, [r2]
	adds r2, r2, r0
	ldrb r2, [r2]
	bl EnlistTarget
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802BEBC: .4byte 0x0202E3DC
