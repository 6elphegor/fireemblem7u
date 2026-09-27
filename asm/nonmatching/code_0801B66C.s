	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_WeatherDraw
DebugMenu_WeatherDraw: @ 0x0801B66C
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801B6E8 @ =0x081C3B88
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0801B6EC @ =0x08B9333C
	bl Proc_Find
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, _0801B6F0 @ =0x0000124F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, [r6, #0x58]
	movs r1, #7
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B6F4 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B6E8: .4byte 0x081C3B88
_0801B6EC: .4byte 0x08B9333C
_0801B6F0: .4byte 0x0000124F
_0801B6F4: .4byte 0x02022C60
