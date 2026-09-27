	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaResume
ArenaResume: @ 0x0802EA9C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802EABC @ =0x0203A862
	adds r0, r4, #0
	bl RandSetSt
	adds r0, r5, #0
	bl ArenaBeginInternal
	subs r4, #6
	adds r0, r4, #0
	bl RandSetSt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EABC: .4byte 0x0203A862
