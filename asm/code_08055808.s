	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTogiColor
NewEkrTogiColor: @ 0x08055808
	push {r4, lr}
	ldr r4, _0805582C @ =0x0201FB18
	ldr r0, _08055830 @ =0x08B9B364
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08055834 @ =0x081D8644
	str r1, [r0, #0x48]
	ldr r1, _08055838 @ =0x08B9B37C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805582C: .4byte 0x0201FB18
_08055830: .4byte 0x08B9B364
_08055834: .4byte 0x081D8644
_08055838: .4byte 0x08B9B37C
