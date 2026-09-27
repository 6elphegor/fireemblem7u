	.include "macro.inc"

	.syntax unified

	thumb_func_start AiRefreshDangerMap
AiRefreshDangerMap: @ 0x080393BC
	push {lr}
	ldr r0, _080393E0 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne _080393DC
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080393E4 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	bl AiFillDangerMap
_080393DC:
	pop {r0}
	bx r0
	.align 2, 0
_080393E0: .4byte 0x0203A8EC
_080393E4: .4byte 0x0202E3F4
