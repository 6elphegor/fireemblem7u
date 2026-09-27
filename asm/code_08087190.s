	.include "macro.inc"

	.syntax unified

	thumb_func_start NewChapterStatusScreen
NewChapterStatusScreen: @ 0x08087190
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _080871B0
	ldr r0, _080871AC @ =0x08CC2EA0
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	b _080871BC
	.align 2, 0
_080871AC: .4byte 0x08CC2EA0
_080871B0:
	ldr r0, _080871C4 @ =0x08CC2EA0
	movs r1, #3
	bl Proc_Start
	adds r0, #0x3f
	strb r4, [r0]
_080871BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080871C4: .4byte 0x08CC2EA0
