	.include "macro.inc"

	.syntax unified

	thumb_func_start EventDF_SnowStormfx
EventDF_SnowStormfx: @ 0x0801135C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _08011384
	ldr r0, _08011380 @ =0x08B92034
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r0, #2
	b _08011386
	.align 2, 0
_08011380: .4byte 0x08B92034
_08011384:
	movs r0, #0
_08011386:
	pop {r4}
	pop {r1}
	bx r1
