	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncEkrDispUP
SyncEkrDispUP: @ 0x0804CE10
	ldr r0, _0804CE1C @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CE1C: .4byte 0x0200006C
