	.include "macro.inc"

	.syntax unified

	thumb_func_start TacticianDrawCharacters
TacticianDrawCharacters: @ 0x0803F294
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r4, #0x3d
	ldr r5, _0803F2DC @ =0x0203DC18
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803F2C6
	adds r6, r5, #0
	movs r5, #0
_0803F2AC:
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_SetCursor
	adds r0, r6, #0
	adds r1, r4, #0
	bl Text_DrawCharacter
	adds r4, r0, #0
	adds r5, #7
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803F2AC
_0803F2C6:
	ldr r0, _0803F2DC @ =0x0203DC18
	ldr r1, _0803F2E0 @ =0x02022DB8
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F2DC: .4byte 0x0203DC18
_0803F2E0: .4byte 0x02022DB8
