	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonBg3HfScrollHandler
NewEkrDragonBg3HfScrollHandler: @ 0x08065CDC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08065D0C @ =0x08BD94D8
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	mov r1, r8
	str r1, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08065D0C: .4byte 0x08BD94D8
