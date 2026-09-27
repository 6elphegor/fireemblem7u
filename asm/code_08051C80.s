	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrBaseAppear
NewEkrBaseAppear: @ 0x08051C80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08051CA4 @ =0x08B9B274
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne _08051CAC
	ldr r2, _08051CA8 @ =0x0000FFA8
	movs r0, #2
	bl SetBgOffset
	b _08051CB6
	.align 2, 0
_08051CA4: .4byte 0x08B9B274
_08051CA8: .4byte 0x0000FFA8
_08051CAC:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08051CB6:
	ldr r1, _08051CC4 @ =0x0201FAC8
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051CC4: .4byte 0x0201FAC8
