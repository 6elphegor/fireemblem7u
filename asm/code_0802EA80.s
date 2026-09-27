	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaBegin
ArenaBegin: @ 0x0802EA80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802EA98 @ =0x0203A862
	bl RandGetSt
	adds r0, r4, #0
	bl ArenaBeginInternal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA98: .4byte 0x0203A862
