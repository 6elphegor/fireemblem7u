	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrWindowAppear
NewEkrWindowAppear: @ 0x08051A9C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08051AE0 @ =0x08B9B23C
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne _08051ABE
	movs r2, #0x39
_08051ABE:
	ldr r1, _08051AE4 @ =0x02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC78
	ldr r1, _08051AE8 @ =0x0201FAC0
	movs r0, #1
	str r0, [r1]
	bl EkrGauge_ClrInitFlag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051AE0: .4byte 0x08B9B23C
_08051AE4: .4byte 0x02000038
_08051AE8: .4byte 0x0201FAC0
