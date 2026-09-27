	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B568
sub_0809B568: @ 0x0809B568
	push {r4, r5, r6, lr}
	ldr r4, _0809B5E0 @ =0x02012A90
	bl GetTotalSupportCollection
	adds r5, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl ClearText
	movs r6, #0
	cmp r5, #0x64
	bne _0809B582
	movs r6, #4
_0809B582:
	ldr r0, _0809B5E4 @ =0x000012C9
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x30
	bl Text_SetCursor
	movs r1, #2
	cmp r5, #0x64
	bne _0809B5A4
	movs r1, #4
_0809B5A4:
	adds r0, r4, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r4, #0
	movs r1, #1
	bl Text_Skip
	movs r2, #0
	cmp r5, #0x64
	bne _0809B5C2
	movs r2, #4
_0809B5C2:
	ldr r3, _0809B5E8 @ =0x0840F420
	adds r0, r4, #0
	movs r1, #0x38
	bl Text_InsertDrawString
	ldr r1, _0809B5EC @ =0x02023108
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B5E0: .4byte 0x02012A90
_0809B5E4: .4byte 0x000012C9
_0809B5E8: .4byte 0x0840F420
_0809B5EC: .4byte 0x02023108
