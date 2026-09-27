	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDispUP
NewEkrDispUP: @ 0x0804CD64
	push {r4, lr}
	ldr r4, _0804CD8C @ =0x0200006C
	ldr r0, _0804CD90 @ =0x08B9ABAC
	movs r1, #5
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_SetPositionUnsync
	bl EkrDispUP_0804D584
	bl UnAsyncEkrDispUP
	bl UnsyncEkrDispUP
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD8C: .4byte 0x0200006C
_0804CD90: .4byte 0x08B9ABAC
